return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPre",
  config = {
    ensure_installed = {
      "solargraph",
    },
    automatic_installation = true,
  }
}
