API/api_summary.md
API/api_summary.md
cat << 'EOF' > API/api_summary.md
# API Summary

## What is a REST API?
A REST API is a web interface that lets applications communicate over HTTP using standard methods like GET and POST to exchange data. It is typically stateless and returns structured data—most commonly JSON—that scripts and tools can easily parse.

## HTTP Status Codes Observed
- **200 (OK):** The request succeeded and the server returned the requested data or resource.
- **404 (Not Found):** The server could not find a resource matching the requested URL (such as a nonexistent user or endpoint).

## jq Filter Breakdown
Filter used:
`{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}`

- `{ ... }` builds a new JSON object containing only the selected fields.
- `name:.name` creates a `name` key using the `.name` field from the JSON response.
- `repos:.public_repos` extracts `.public_repos` under the `repos` key.
- `followers:.followers` extracts `.followers` under the `followers` key.
- `joined:.created_at` extracts `.created_at` under the `joined` key.
