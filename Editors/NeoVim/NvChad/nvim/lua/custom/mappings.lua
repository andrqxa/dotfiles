local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dB"] = {
      function()
        require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      "Set breakpoint condition"
    },
    ["<leader>dlp"] = {
      function()
        require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
      end,
      "Set log point message"
    },
    ["<leader>dr"] = {
      function()
        require('dap').repl.open()
      end,
      "Open REPL"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<F5>"] = {
      function()
        require('dap').continue()
      end,
      "Continue debug"
    },
    ["<F10>"] = {
      function()
        require('dap').step_over()
      end,
      "Step over"
    },
    ["<F11>"] = {
      function()
        require('dap').step_into()
      end,
      "Step into"
    },
    ["<F12>"] = {
      function()
        require('dap').step_out()
      end,
      "Step out"
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    },
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

return M
