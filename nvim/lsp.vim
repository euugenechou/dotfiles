set completeopt=menu,menuone,noselect

lua <<EOF
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "c",
    "cpp",
    "python",
    "rust",
    "latex",
  }
}

local nvim_lsp = require('lspconfig')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gsv', '<Cmd>vsp<CR>:lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gss', '<Cmd>sp<CR>:lua vim.lsp.buf.definition()<CR>', opts)

  vim.keymap.set("n", "<leader>k", function()
    local util = require"vim.lsp.util"
    vim.lsp.buf_request(0, 'textDocument/hover', util.make_position_params(), function(_, result, ctx, config)
      config = config or {}
      config.focus_id = ctx.method
      if not (result and result.contents) then
        -- return { 'No information available' }
        return
      end
      local markdown_lines = util.convert_input_to_markdown_lines(result.contents)
      -- trims beg and end of whole content
      markdown_lines = util.trim_empty_lines(markdown_lines)
      if vim.tbl_isempty(markdown_lines) then
        return
      end

      vim.api.nvim_command [[ new ]]
      vim.api.nvim_buf_set_lines(0, 0, 1, false, markdown_lines)
      vim.api.nvim_command [[ setlocal ft=markdown ]]
      vim.api.nvim_command [[ nnoremap <buffer>q <C-W>c ]]
      vim.api.nvim_command [[ setlocal buftype+=nofile ]]
      vim.api.nvim_command [[ setlocal nobl ]]
      vim.api.nvim_command [[ setlocal conceallevel=2 ]]
      vim.api.nvim_command [[ setlocal concealcursor+=n ]]
    end)
  end)

  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<cr>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.abort(), -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer", "clangd", "texlab", "pyright", "sqls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end
EOF

" Snippet jumping.
smap <expr> <c-l> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<c-l>'
imap <expr> <c-h> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<c-h>'
imap <expr> <c-l> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-l>'
smap <expr> <c-l> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<c-l>'
imap <expr> <c-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-h>'
smap <expr> <c-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-h>'
