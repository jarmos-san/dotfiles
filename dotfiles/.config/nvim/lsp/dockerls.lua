return {
  cmd = { "docker-language-server", "start", "--stdio" },
  filetypes = { "dockerfile" },
  root_markers = { "Dockerfile" },
  settings = {
    docker = {
      languageServer = {
        formatter = {
          ignoreMultilineInstructions = false,
        },
        diagnostics = {
          deprecatedMaintainer = "warning",
          directiveCasing = "warning",
          emptyContinuationLine = "error",
          instructionCasing = "error",
          instructionCmdMultiple = "error",
          instructionEntrypointMultiple = "error",
          instructionHealthcheckMultiple = "error",
          instructionJSONInSingleQuotes = "error",
        },
      },
    },
  },
}
