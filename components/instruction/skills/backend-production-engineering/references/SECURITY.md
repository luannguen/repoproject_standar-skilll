# Security, Authorization, Tenancy, Privacy, and Configuration

## Contents

1. Threat and trust review
2. Authentication
3. Authorization and tenant isolation
4. Input/output and common attack classes
5. Rate limiting and abuse
6. Secrets and configuration
7. Privacy and audit integrity
8. Security completion gate

## 1. Threat and trust review

Identify assets, actors, entry points, trust boundaries, attacker capabilities, privileged operations, sensitive data, external dependencies, failure/abuse cases, and detection/recovery.

- [BLOCKER] Treat client claims, identifiers, role/tenant fields, webhook payloads, files, redirects, queue messages, cached data, and provider responses as untrusted until verified.
- [MUST] Review horizontal/vertical privilege escalation, IDOR, cross-tenant access, mass assignment, stale permission/session, invitation abuse, role escalation, public exposure, replay, and data exfiltration.
- [MUST] Apply least privilege to users, services, tokens, storage, database/entity access, and operator tooling.
- [BLOCKER] Security by obscurity or hidden frontend controls are not authorization.

## 2. Authentication

- [MUST] Use the verified project/platform authentication mechanism; do not invent session/token behavior.
- [MUST] Validate token/session authenticity, expiry, audience/scope, revocation semantics, and environment.
- [BLOCKER] Never accept a client-supplied identity/role claim outside the verified authentication context.
- [MUST] Handle expired/revoked users and permission changes during long workflows.
- [MUST] Rate-limit and audit login, reset, OTP, invitation, and recovery flows.
- [MUST] Protect account enumeration through response and timing behavior appropriate to risk.
- [MUST] Require re-authentication, step-up, approval, or dual control for high-risk operations when business/security policy requires it.
- [MUST] Secure session cookies/tokens according to the actual transport and threat model; assess CSRF for cookie-based authority.
- [BLOCKER] Do not log or expose passwords, session tokens, reset tokens, OTPs, private keys, or provider credentials.

## 3. Authorization and tenant isolation

Separate authentication (who), action permission (what), resource ownership (which object), scope (where), tenant isolation, and field-level access.

- [BLOCKER] Enforce every material permission on the server.
- [BLOCKER] Check object/resource authorization, not only endpoint/function permission.
- [BLOCKER] Scope every tenant read/write to an authoritative tenant context.
- [BLOCKER] Never trust a client tenant ID to grant access; compare/derive it from authenticated server context.
- [MUST] Prefer centralized capability/policy checks over scattered role-name conditions.
- [MUST] Keep permission data and invalidation/revocation semantics explicit.
- [BLOCKER] Prevent mass assignment of owner, tenant, role, permission, price, balance, payment state, system/audit, and workflow-control fields.
- [MUST] Apply field-level read/write filters to sensitive attributes.
- [MUST] Audit privileged/admin/impersonation/permission-changing actions with actor, subject, scope, reason, result, and correlation ID.
- [MUST] Make impersonation explicit, time-bounded, least-privileged, and fully auditable.
- [MUST] Avoid leaking existence/metadata of forbidden resources through errors, counts, timing, or search.
- [BLOCKER] Cache keys and background jobs must carry verified tenant/authorization scope, not stale client authority.
- [MUST] Test allowed, unauthenticated, forbidden, object-not-owned, cross-tenant, revoked/stale, and field-level cases.

## 4. Input/output and common attack classes

- [BLOCKER] Use parameterized/verified platform queries; never concatenate untrusted input into SQL/query/code/commands.
- [MUST] Validate and canonicalize URLs before server fetches; prevent SSRF to private/link-local/metadata networks and unsafe schemes/redirects.
- [MUST] Prevent path traversal and unsafe archive extraction for file paths.
- [MUST] Validate redirect targets against an allowlist or safe relative policy.
- [MUST] Configure CORS narrowly for actual origins/methods/headers/credentials; do not use permissive wildcard authority without need.
- [MUST] Encode/serialize output for its context and avoid reflecting unsafe provider/client HTML.
- [MUST] Apply CSRF protection according to actual authentication and same-site behavior.
- [MUST] Verify webhook authenticity/replay protection and idempotency.
- [MUST] Avoid returning sensitive/internal fields, stack traces, configuration, keys, or provider diagnostics.
- [MUST] Review dependency vulnerabilities and unsafe deserialization/parsing relevant to changed code.
- [BLOCKER] Do not weaken a security control to make a feature/test pass without explicit approved risk treatment.

## 5. Rate limiting and abuse

Assess login, reset, OTP, invitation, public search/contact, upload, webhook, expensive query/export, AI requests, payment attempts, referral/reward/gift, email, and notification.

- [MUST] Select appropriate keys: user, tenant, IP, token, resource, endpoint, provider account, or combinations.
- [MUST] Define burst, sustained window, cooldown, lockout, quota, and safe failure response.
- [MUST] Prevent distributed abuse and tenant starvation where risk justifies it.
- [MUST] Bound expensive payloads and concurrency even behind rate limits.
- [MUST] Audit/metric significant abuse and avoid leaking sensitive limit internals.
- [SHOULD] Use CAPTCHA/challenge only where abuse evidence and accessibility/user impact justify it.
- [BLOCKER] Rate limiting is not a substitute for authorization, validation, idempotency, or bounded queries.

## 6. Secrets and configuration

- [BLOCKER] Store secrets only in approved environment/secret management; never hard-code or commit them.
- [BLOCKER] Never put privileged secrets/configuration into frontend bundles, public files, URLs, logs, errors, analytics, or task memory.
- [MUST] Separate environments/accounts/credentials and never use production credentials in development/tests.
- [MUST] Validate required configuration at startup/deployment and fail safely on missing/invalid values.
- [MUST] Avoid dangerous defaults for auth, CORS, storage, timeouts, retries, rate limits, and encryption.
- [MUST] Define rotation, revocation, owner, scope, and audit for credentials.
- [MUST] Redact secrets and sensitive data structurally; do not rely on reviewers spotting strings.
- [MUST] Scope provider credentials to least privilege and shortest feasible lifetime.
- [MUST] Treat configuration changes as deployable/versioned changes with compatibility and rollback.
- [BLOCKER] Never log the full environment.

## 7. Privacy and audit integrity

- [MUST] Collect personal/sensitive data only for a documented purpose and minimum scope.
- [MUST] Define access, retention, deletion, export, correction, encryption, backup, and environment behavior.
- [MUST] Keep sensitive data out of debug logs, metrics labels, traces, URLs, and correlation identifiers.
- [MUST] Protect backup/export/admin access as privileged data access.
- [MUST] Separate operational logs from audit records and define retention/access for each.
- [MUST] Make high-risk audit records append-only/tamper-resistant to the degree supported and record gaps.
- [BLOCKER] Do not let the actor being audited freely rewrite/delete the only audit evidence.
- [MUST] Define deletion/retention conflicts for legal/business/audit obligations and obtain approved policy rather than guessing.
- [MUST] Record data disclosure/download/export actions when risk requires it.

## 8. Security completion gate

- [BLOCKER] Server authorization, object ownership, tenant isolation, field access, mass-assignment controls, secret handling, and critical input validation must be verified.
- [BLOCKER] No known injection, IDOR, cross-tenant, privilege-escalation, forged webhook, replay, unsafe upload/path, SSRF, open redirect, raw error, or sensitive-output path remains unmitigated.
- [MUST] Run available auth/authorization/tenant/validation/security/dependency tests and document unavailable checks.
- [MUST] Record residual risk, exception owner/expiry, detection, rollback/recovery, and production-readiness conditions.
