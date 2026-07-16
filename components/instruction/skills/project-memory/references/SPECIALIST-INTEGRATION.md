# Specialist Integration

Required flow:

AI Bootstrap -> Project Memory -> retrieval -> verification -> Memory Context Summary -> specialist skill -> analysis/option -> implementation -> validation -> memory delta -> write-back -> checkpoint or task summary.

## Frontend and UI/UX

Before loading a frontend/UI skill, retrieve user-flow, accessibility, design-system, shared-component, state-management, API-contract, permission, known-regression, and affected-path memory. The specialist may add implementation details but may not contradict verified business/API/permission constraints silently.

After work, update material UI flow, component boundary, reusable pattern, accessibility constraint, contract dependency, test coverage, incident, and known limitation.

## Backend

Before loading a backend skill, retrieve domain invariants, source of truth, data ownership, schema/migrations, API/events, authentication/authorization, integration contracts, observability, incidents, and affected-path memory.

After work, update material boundary, ownership, schema/API/permission contract, migration, root cause, operational constraint, performance/security finding, test evidence, and limitation.

## Full-stack

Create one shared context pack, then separate FE constraints, BE constraints, and their API/schema/permission/UX contract. Resolve assumption conflicts before implementation.

## Missing specialist skills

If the expected UI/UX or Backend Production skill is absent, record a documentation gap. Do not fabricate its rules. Continue only for work safely governed by existing higher-level instructions; otherwise request the missing source or approval to create the specialist policy.
