// Octokit.js
// https://github.com/octokit/core.js#readme
const octokit = new octokit({
  auth: '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'
});

octokit.request('PUT /repos/{pamulavardhan}/{mytfrep}/branches/{main}/protection', {
  owner: 'pamulavardhan',
  repo: 'mytfrep',
  branch: 'main',
  required_status_checks: {
    strict: true,
    contexts: [
      'Guthub-Branch-protection create'
    ]
  },
  enforce_admins: true,
  required_pull_request_reviews: {
    dismissal_restrictions: {
      
    },
    dismiss_stale_reviews: true,
    require_code_owner_reviews: true,
    required_approving_review_count: 2,
    bypass_pull_request_allowances: {
      
    }
  },
  restrictions: {
   
  },
  required_linear_history: true,
  allow_force_pushes: true,
  allow_deletions: true,
  block_creations: true,
  required_conversation_resolution: true
});