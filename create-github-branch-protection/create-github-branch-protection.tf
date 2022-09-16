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
