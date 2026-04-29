# [Product Name] — SDD (MVP, 12 sections)

> Lightweight version. ~30 min to fill. Use for small features, single-agent products, or when you must start coding within hours. **All sections REQUIRED.**

---

## 0. Doc Metadata
| Field | Value |
|---|---|
| Version | v0.1 |
| Status | Draft |
| Owner | [Name] |
| Last Updated | YYYY-MM-DD |
| Repo | [URL] |

---

## 1. TL;DR
[3 sentences: what + for whom + the one thing it does]

---

## 2. Problem & Goals
**Problem**: [1 paragraph]

**Goals**:
- G1: [goal] → metric → target
- G2: ...

**Non-goals**:
- NG1: ...
- NG2: ...

---

## 3. Success Metrics
- **Primary**: [metric] = [target by when]
- **Guardrails**: [latency / cost / accuracy that can't get worse]

---

## 4. Personas
**Primary user**: [name + role + workflow + pain solved]

---

## 5. User Journey (1 happy-path)
1. [Action] → [System response]
2. ...
**End state**: ...

---

## 6. Functional Requirements
| ID | Requirement | Priority | Acceptance |
|---|---|---|---|
| FR-1 | ... | P0 | ... |
| FR-2 | ... | P0 | ... |
| FR-3 | ... | P1 | ... |

---

## 7. AI / Agent Behavior

### LLM
- Model: [e.g. claude-sonnet-4]
- Provider: [e.g. Vercel AI Gateway]
- Prompt files: `prompts/<name>.md` (NEVER hardcoded)

### Workflow (steps)
1. [Step] → [Output]
2. ...

### Tools (if function-calling)
- `tool_name(args)`: purpose, input, output

### Eval
- Golden set: [N examples] in `eval/golden.json`
- Pass bar: [%] match expected traits

---

## 8. Data & API

### Data model
```typescript
type Entity = {
  id: string
  ...
}
```

### API endpoints
| Method | Path | Req | Resp |
|---|---|---|---|
| GET | `/api/...` | — | ... |
| POST | `/api/...` | `{...}` | `{...}` |

---

## 9. UI (1-line wireframe)
```
[Sketch: header / main interaction / output area]
```

---

## 10. Tech Stack & Deploy
- Framework: ...
- LLM: ...
- DB / Cache: ...
- Host: ...
- Env vars: `KEY1`, `KEY2` (in Vercel env)

---

## 11. Failure Modes
| Mode | Mitigation |
|---|---|
| LLM hallucinates | ... |
| Source down | ... |
| Cost spike | ... |
| Prompt injection | ... |

---

## 12. Acceptance Criteria
> Pass / fail must be unambiguous and human-testable.

- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] Eval golden set passes >=80%
- [ ] Mobile-usable (iPhone Safari)
- [ ] No secrets in client bundle
