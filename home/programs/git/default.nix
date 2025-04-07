{userMetaData, ...}: {
  programs = {
    git = {
      enable = true;
      userEmail = userMetaData.env.GIT_EMAIL;
      userName = userMetaData.env.GIT_USERNAME;
      extraConfig = {
        safe = {
          directory = "*";
        };
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper = {enable = true;};
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          showNumstatInFilesView = true;
          theme = {
            selectedLineBgColor = ["#1f1f28"];
            defaultFgColor = ["#ffa066"];
          };
        };

        git = {
          commit = {
            signOff = true;
          };
          autoStageResolvedConflicts = false;
          parseEmoji = true;
        };

        customCommands = [
          {
            key = "C";
            context = "files";
            command = "git commit -m '{{ .Form.Type }}{{if .Form.Scopes}}({{ .Form.Scopes }}){{end}}{{if eq .Form.Breaking `yes`}}!{{end}}: {{ .Form.Description }}'";
            description = "Commit with type and description";
            prompts = [
              {
                type = "menu";
                title = "Select the type of change you are committing";
                key = "Type";
                options = [
                  {
                    name = "Feature";
                    value = "feat";
                    description = "A new feature";
                  }
                  {
                    name = "Fix";
                    value = "fix";
                    description = "A bug fix";
                  }
                  {
                    name = "Docs";
                    value = "docs";
                    description = "Documentation only changes";
                  }
                  {
                    name = "Style";
                    value = "style";
                    description = "Changes that do not affect the meaning of the code";
                  }
                  {
                    name = "Refactor";
                    value = "refactor";
                    description = "A code change that neither fixes a bug nor adds a feature";
                  }
                  {
                    name = "Perf";
                    value = "perf";
                    description = "A code change that improves performance";
                  }
                  {
                    name = "Test";
                    value = "test";
                    description = "Adding missing tests or correcting existing tests";
                  }
                  {
                    name = "Build";
                    value = "build";
                    description = "Changes that affect the build system or external dependencies";
                  }
                  {
                    name = "CI";
                    value = "ci";
                    description = "Changes to our CI configuration files and scripts";
                  }
                  {
                    name = "Chore";
                    value = "chore";
                    description = "Other changes that don't modify src or test files";
                  }
                  {
                    name = "Revert";
                    value = "revert";
                    description = "Reverts a previous commit";
                  }
                ];
              }
              {
                type = "input";
                title = "Enter the scope of this change";
                key = "Scopes";
              }
              {
                type = "input";
                title = "Enter a short description of the change";
                key = "Description";
              }
              {
                type = "menu";
                title = "Is this a breaking change?";
                key = "Breaking";
                options = [
                  {
                    name = "No";
                    value = "no";
                    description = "This change does not contain a breaking change";
                  }
                  {
                    name = "Yes";
                    value = "yes";
                    description = "This change contains a breaking change";
                  }
                ];
              }
              {
                type = "confirm";
                title = "Is the generated commit below correct?";
                body = "{{ .Form.Type }}{{if .Form.Scopes}}({{ .Form.Scopes }}){{end}}{{if eq .Form.Breaking `yes`}}!{{end}}: {{ .Form.Description }}";
              }
            ];
          }
        ];
      };
    };
  };
}
