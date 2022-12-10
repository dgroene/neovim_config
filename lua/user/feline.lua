local status_ok, feline = pcall(require, "feline")
if not status_ok then
    -- send message to user
    print("feline-nvim not found")
    return
end

  local colors = {
    bg = '#F2EFDF',
    fg = '#1d1f48',
    yellow = '#FEF2D5',
    cyan = '#8abeb7',
    darkblue = '#1d1f48',
    green = '#F0F2D4',
    orange = '#DBBC7F',
    violet = '#D699B6',
    magenta = '#FFE7DE',
    blue = '#3F5865';
    red = '#e88388';
  }

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

local comps = {
    dontpanic = {
        provider = function()
            return "Don't Panic!"
        end,
        hl = {
            fg = 'oceanblue',
            bg = 'white',
            style = 'bold'
        }
    },
    position = {
        provider =  'position',
      -- Pad line and column numbers, use default amount for padding.
        -- padding = true,
        -- padding = {
        --   line = 2,
        --   col = 2,
        -- },
        format = 'Ln {line}, Col {col}',
        hl = {
            fg = 'magenta',
            bg = 'white',
            style = 'bold'
        }, 
        right_sep = {
          str = 'vertical_bar_thin',
          hl = {
            fg = 'oceanblue',
          },
        },
    },
    line_percentage = {
      provider = 'line_percentage',
      hl = {
        fg = 'magenta',
        bg = 'white',
        style = 'bold'
      },
    },
    fileinfo = {
      provider = 'file_info',
      hl = {
          fg = 'white',
          bg = 'oceanblue',
          style = 'bold'
      },
      left_sep = {' ', 'slant_left_2'},
      right_sep = {'slant_right_2', ' '},
      -- Uncomment the next line to disable file icons
      -- icon = ''
    },
    git = {
        branch = {
            provider = 'git_branch',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = 'oceanblue',
                bg = 'white',
                style = 'bold'
            }
        },
        add = {
            provider = 'git_diff_added',
            hl = {
                fg = 'green',
                bg = 'white',
            }
        },
        change = {
            provider = 'git_diff_changed',
            hl = {
                fg = 'magenta',
                bg = 'white',
            }
        },
        remove = {
            provider = 'git_diff_removed',
            hl = {
                fg = 'red',
                bg = 'white' 
            }
        }
    },
    vi_mode = {
        provider = 'vi_mode',
        hl = function()
         return {
            name = vi_mode_utils.get_mode_highlight_name(),
            fg = vi_mode_utils.get_mode_color(),
            bg = 'white',
            style = 'bold'
         }
       end,
       right_sep = ' ',
       icon = ''
   },
   diagnostics = {
      diagnostic_errors = {
        provider = 'diagnostic_errors',
        enabled = function() return lsp.diagnostics_exist('Error') end,
        icon = '  ',
        hl = {
          fg = 'red',
          bg = 'white',
        },
      },
   }
}


    local components = {
        active = {},
        inactive = {}
    }
   components.active = {
     { comps.fileinfo, comps.position, comps.line_percentage, comps.diagnostics.diagnostic_errors },
     { comps.git.branch, comps.git.add, comps.git.change, comps.git.remove },
     { comps.vi_mode }
   }
   components.inactive = {
      { comps.dontpanic }
    }

    -- :table.insert(components.inactive[1], comps.dontpanic)
require('feline').setup {
  components = components,
  theme = {
    bg = "#FFFFFF"
  }
}
