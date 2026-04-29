# Public API

CybrHawk provides a public REST API that allows customers and partners to programmatically access key platform data. This enables seamless integration with external systems, automation workflows, and custom reporting. Support for interactive actions and additional capabilities will be introduced in future releases.

### Authentication

All API requests are authenticated using an API key. Each request must include a valid API key with the appropriate permissions to ensure secure access to CybrHawk resources.

### API Key Generation

To get started, navigate to API Keys in the CybrHawk platform and create a new API key with relevant permissions for the target APIs.

Keep your API key secure and avoid sharing it publicly, as it provides access to your tenant’s data.

### Usage

CybrHawk exposes its APIs through a number of scoped public endpoints.

#### Alert Center

All alert interactions and lifecycle events, including escalations, notifications, and triage.

Permission Requirements: `Alert Center`

[Swagger docs](https://portal.cybrhawk.com/docs/ac/index.html#/)

#### Agent Interactions

Endpoint Agent information and state, including version, last seen, and OS information.

Permission Requirements: `Endpoint Isolation`

[Swagger docs](https://portal.cybrhawk.com/docs/agents)

***

## Having Trouble?

If you're having any issues with user management, please open a request via the support portal, or email our support email at "support@threatdefence.com" and our team will assist you.
