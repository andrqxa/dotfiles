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
    ["<F5>"] = {
      "<cmd> DapContinue <CR>",
      "Continue debug"
    },
    ["<F6>"] = {
      "<cmd> DapTerminate <CR>",
      "Terminate debug"
    },
    ["<F10>"] = {
      "<cmd> DapStepOver <CR>",
      "Step over"
    },
    ["<F9>"] = {
      "<cmd> DapStepInto <CR>",
      "Step into"
    },
    ["<F12>"] = {
      "<cmd> DapStepOut <CR>",
      "Step out"
    },
  }
}

M.dap_ui = {
  plugin = true,
  n = {
    ["<leader>duo"] = {
      function()
        require('dapui').open()
      end,
      "Debug open UI"
    },
    ["<leader>duc"] = {
      function()
        require('dapui').close()
      end,
      "Debug close UI"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
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
