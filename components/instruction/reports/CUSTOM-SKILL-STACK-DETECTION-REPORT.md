# Custom Skill Stack Detection Report

Date: 2026-07-16
Profile: `template/uninstantiated`

## Result

The detector evaluated all 14 reusable technology skills. Only `github-ci` is detected, at HIGH confidence. No application dependency manifest, lockfile, runtime pin, framework configuration, schema, provider SDK, deployment target, or application source exists.

| Skill | Detected | Confidence | Version/evidence |
|---|---:|---|---|
| react-typescript | no | NONE | no package/TypeScript source evidence |
| nextjs | no | NONE | no Next.js dependency/router/config |
| vite-react | no | NONE | no Vite/React dependency/config |
| supabase-platform | no | NONE | no Supabase dependency/config |
| postgres-supabase-db | no | NONE | no Supabase SQL migrations |
| vercel-platform | no | NONE | no Vercel project/config |
| tanstack-query | no | NONE | no dependency/source evidence |
| react-hook-form-zod | no | NONE | no paired dependencies |
| tailwind-shadcn | no | NONE | no Tailwind dependency plus components.json |
| pwa-webview | no | NONE | no manifest plus service worker |
| base44-platform | no | NONE | no SDK/config/platform source |
| github-ci | yes | HIGH | Git metadata plus `.github/workflows/quality-gates.yml`; platform-managed |
| nodejs-runtime | no | NONE | no engines/version pin/runtime source |
| ai-llm-integration | no | NONE | no provider SDK/integration source |

Source of truth: `project-custom-skills/PROJECT-STACK-MANIFEST.json`. Re-run detection after clone onboarding and every material dependency/platform/configuration change.
