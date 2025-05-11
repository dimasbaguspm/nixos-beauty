{
  programs.nixvim = {
    plugins = {
      copilot-chat = {
        enable = true;
        settings = {
          model = "claude-3.7-sonnet";
          prompts = {
            Commit = {
              prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.";
              selection = "require('CopilotChat.select').gitdiff";
            };
            CommitStaged = {
              prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.";
              selection = ''
                function(source)
                  return select.gitdiff(source, true)
                end
              '';
            };
            Docs = {
              prompt = "/COPILOT_GENERATE add documentation comment for this buffer, should be use lowercase and start with a verb and no period at the end";
            };
            Explain = {
              prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.";
            };
            Fix = {
              prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.";
            };
            FixDiagnostic = {
              prompt = "Please assist with the following diagnostic issue in file:";
              selection = "require('CopilotChat.select').diagnostics";
            };
            Refactor = {
              prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance, readablilty, and scalability";
            };
            Review = {
              callback = ''
                function(response, source)
                  -- see config.lua for implementation
                end
              '';
              prompt = "/COPILOT_REVIEW Review the selected code, provide the downside and winside of the code, and suggest improvements";
            };
            Tests = {
              prompt = "/COPILOT_GENERATE generate tests for my code based on the project setup, ensure the downside or side effect or bad scenario also covered";
            };
          };
          window = {
            border = "rounded";
            layout = "float";
            height = 0.75;
            width = 0.75;
          };
        };
      };
    };
    keymaps = [
      {
        key = "<leader>ac";
        mode = "n";
        action = "<cmd>CopilotChatOpen<cr>";
        options.desc = "Open Copilot Chat";
      }
      {
        key = "<leader>ap";
        mode = "n";
        action = "<cmd>CopilotChatPrompts<cr>";
        options.desc = "Copilot Chat Prompts";
      }
    ];
  };
}
