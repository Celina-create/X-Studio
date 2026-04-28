<h1 align="center">X-Studio</h1>
<h3 align="center">AI 에이전트 시대의 그로스 운영 랩.</h3>

<p align="center">
  <em>실제로 돌려본 그로스 시스템을 정리합니다 — 사람이 검토하고, 에이전트가 실행할 수 있도록.</em>
</p>

<p align="center">
  <a href="./README.md">English</a> ·
  <a href="./README.zh.md">中文</a> ·
  <a href="./README.ko.md">한국어</a>
</p>

<p align="center">
  <a href="https://github.com/Celina-create/X-Studio/stargazers"><img src="https://img.shields.io/github/stars/Celina-create/X-Studio?style=flat-square&logo=github&label=stars&color=181717" alt="Stars"></a>
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-black?style=flat-square" alt="License"></a>
  <img src="https://img.shields.io/badge/skills-9-black?style=flat-square" alt="Skills">
  <img src="https://img.shields.io/badge/playbooks-6-black?style=flat-square" alt="Playbooks">
  <img src="https://img.shields.io/badge/research-1-black?style=flat-square" alt="Research">
  <img src="https://img.shields.io/badge/case--studies-1-black?style=flat-square" alt="Case Studies">
</p>

---

## 관점

> **모든 그로스 전술에는 반감기가 있다.**

지난 분기에 통하던 방법이 이번 분기에는 통하지 않습니다. 아웃리치는 이메일에서 트위터 DM으로, 다시 GitHub 이슈로 옮겨갔습니다. 콘텐츠는 블로그에서 스레드로, 다시 AI 네이티브 포맷으로 이동했습니다. 시드 유저는 대기자 명단에서 경쟁사 사용자 픽업으로 바뀌었습니다.

**표면의 전술은 점점 쉬워지고, 밑단의 craft 는 점점 어려워집니다.** X-Studio 는 그 반감기를 지나도 살아남는 시스템을 정리한 곳입니다. 모든 폴더는 실제 캠페인에서 검증한 자료입니다. 모든 스킬은 AI 에이전트가 직접 실행할 수 있도록 작성되어 있고, 동시에 그로스 운영자가 "실행" 버튼을 누르기 전에 읽어볼 수 있도록 쓰여 있습니다.

이 저장소는 **튜토리얼이나 블로그가 아닙니다.** 일이 실제로 일어나는 **bench(작업대)** — 그것을 외부에 공개한 공간입니다.

---

## 디렉토리 구조

| 폴더 | 역할 |
|---|---|
| [`skills/`](./skills) | 원자 단위, 에이전트가 실행 가능한 그로스 작업 — Cursor / Claude Code / Codex 에 마운트 |
| [`playbooks/`](./playbooks) | 내러티브 SOP — 여러 스킬이 어떻게 하나의 캠페인으로 합쳐지는지 |
| [`research/`](./research) | 현장 보고서 및 생태계 스냅샷 — 저널리즘이 아닌 운영자의 해석 |
| [`templates/`](./templates) | 즉시 사용 가능한 자산 — 콜드 메일, 랜딩 페이지, 이슈 폼 |
| [`case-studies/`](./case-studies) | 실제 캠페인 — 방법, 데이터, 무엇이 효과 있었고 무엇이 아니었는지 |

---

## 스킬 목록 (v0.1 · 현재 9 개)

각 스킬은 실제 캠페인에서 한 번 이상 사용된 뒤에 저장소에 들어옵니다.

| # | Skill | 한 줄 설명 |
|---|---|---|
| 1 | [`stargazer-email-scraper`](./skills/stargazer-email-scraper) | **경쟁사 GitHub 저장소 스타거저** 의 공개 이메일 추출 (적중률 15–17%) |
| 2 | [`competitive-intel-mining`](./skills/competitive-intel-mining) | **경쟁사 공개 커뮤니티** (GitHub / Discord / Reddit) 에서 페인을 호소하는 고의도 사용자 발굴 |
| 3 | [`seed-user-pool-stratification`](./skills/seed-user-pool-stratification) | 시드 유저 풀을 **ROI 기준으로 계층화** — 누구에게 먼저 보내고 누구에게 마지막에 보낼지 결정 |
| 4 | [`personalized-cold-outreach`](./skills/personalized-cold-outreach) | 시드 CSV 를 받아 **1:1 개인화 콜드 메일을 배치 생성** — 첫 세 문장이 그 사용자에게만 참이어야 함 |
| 5 | [`landing-to-issue-funnel`](./skills/landing-to-issue-funnel) | **콜드 메일 → 랜딩 페이지 → 사전 입력된 GitHub Issue** 의 캡처 퍼널 구성 — 모든 피드백이 공개 자산이 됨 |
| 6 | [`content-repurpose-engine`](./skills/content-repurpose-engine) | 하나의 인사이트 → **이중언어 스레드 / 장문 / 비디오 훅** 동시 출력 |
| 7 | [`growth-experiment-template`](./skills/growth-experiment-template) | 구조화된 **그로스 실험 문서 템플릿** — 가설, 지표, 결정 규칙, 회고 |
| 8 | [`reddit-account-warmup`](./skills/reddit-account-warmup) | **Reddit 계정 6 주 워밍업 SOP** — 60 초 사전 점검 리스트, 카르마 상승 공식, 삭제 복구 SOP |
| 9 | [`community-content-bot`](./skills/community-content-bot) | **Feishu + Discord 이중언어 일일 콘텐츠 봇** — GitHub Actions 위에서 동작, 60 분 배포, 월 $10 미만 |

**로드맵 예고**: `linkedin-content-warmup`, `x-account-warmup`, `discord-community-seeding`, `outbound-followup-sequencer` — 실제로 한 번 돌려본 뒤에 추가됩니다.

---

## 사용법

### AI 에이전트의 스킬셋으로

```bash
git clone https://github.com/Celina-create/X-Studio.git ~/x-studio

# 전체 마운트
ln -s ~/x-studio/skills ~/.claude/skills/x-studio

# 또는 개별 스킬
ln -s ~/x-studio/skills/competitive-intel-mining ~/.cursor/skills/competitive-intel-mining
```

채팅에서 이름으로 호출:

> *"이 경쟁사의 GitHub 이슈에서 `competitive-intel-mining` 을 실행해줘."*  
> *"`reddit-account-warmup` 을 돌리고, 지금 몇 주차인지 알려줘."*

### 사람을 위한 레퍼런스로

저장소 안의 어떤 것도 카피라이트로 잠겨 있지 않습니다. 유용한 부분은 가져가세요. 별 하나는 감사하지만, 의무는 아닙니다.

---

## 방법론

X-Studio 에 들어올 자격을 결정하는 네 가지 원칙.

1. **최소 한 번은 실제로 돌려봤어야 한다.** 이론적인 플레이북은 받지 않습니다 — 캠페인에서 검증되지 않았다면 들어올 수 없습니다.
2. **볼륨보다 ROI.** 어떤 "리스트"든 하위 50% 는 보통 노이즈입니다 — 메시지를 보내기 전에 잘라냅니다.
3. **에이전트도 운영자다.** 모든 스킬은 코딩 에이전트가 끝까지 실행할 수 있도록 구성되어 있습니다. 핸드오프 지점, 상태, 산출물이 모두 명시적입니다.
4. **방법은 공개, 신비주의는 비공개.** 방법 / 추론 / 한계 모두 공개. 클라이언트와 사용자 데이터만 익명화합니다.

---

## 현재 상태

| | 오늘 |
|---|---|
| **출시된 스킬** | 9 |
| **플레이북** | 6 (1 그로스 + 1 커뮤니티 + 4-piece [오픈소스 DevRel 시스템](./playbooks/open-source-devrel/)) |
| **리서치 리포트** | 1 ([Feishu × OpenClaw 생태계 스냅샷](./research/2026-03-feishu-openclaw-ecosystem-snapshot.md)) |
| **케이스 스터디** | 1 ([이중언어 콘텐츠 봇 회고](./case-studies/01-content-bot-postmortem.md)) |
| **라이선스** | MIT |

저장소는 작은 단위로 자주 업데이트됩니다 — 새 스킬은 검증되는 즉시 올라옵니다. **Watch** 해두면 가장 먼저 알 수 있습니다.

---

## 메인테이너

**Celina** ([`@Celina-create`](https://github.com/Celina-create)) 가 운영합니다 — 아웃리치, 콘텐츠, 시딩을 "감각" 이 아닌 "엔지니어링 가능한 시스템" 으로 다루는 그로스 운영자.

협업, 맞춤형 스킬 요청, 또는 노트 교환:

- 📩 [`suokata@naver.com`](mailto:suokata@naver.com)
- 🐛 [Issue 열기](https://github.com/Celina-create/X-Studio/issues/new/choose)

---

## 라이선스

MIT © 2026 Celina · 사용 / 포크 / 리믹스 자유, 가능하다면 출처를 표기해 주세요.

---

<p align="center">
  <sub>그로스는 기술입니다. 여기는 작업대입니다.</sub>
</p>
