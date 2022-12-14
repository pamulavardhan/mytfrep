provider "github" {
  token = "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"
}

data "github_repository" "example" {
  name        = "mytfrep"
}

# Protect the main branch of the foo repository. Only allow a specific user to merge to the branch.
resource "github_branch_protection" "example" {
  repository_id       = "${data.github_repository.example.name}"  
  pattern             = "main"
  enforce_admins      = true
  

  required_status_checks {
    strict   = false
    contexts = ["delete"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews  = false
    restrict_dismissals    = false
  }

}
