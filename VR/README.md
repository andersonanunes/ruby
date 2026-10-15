# Projeto VR — Teste Prático QA

Solução do teste prático descrito em [15.07.2021 Descritivo e Teste QA.pdf](15.07.2021%20Descritivo%20e%20Teste%20QA.pdf).

| Pasta | Escopo | Stack |
|-------|--------|-------|
| [api/](api/) | Backend — endpoint de enumerações do portal | Ruby + Cucumber + HTTParty + RSpec |
| [api-cypress/](api-cypress/) | Backend — mesmo cenário | Cypress (`cy.request`, JavaScript) |
| [api-playwright/](api-playwright/) | Backend — mesmo cenário | Playwright Test (fixture `request`, JavaScript) |
| [api-robot/](api-robot/) | Backend — mesmo cenário | Robot Framework + RequestsLibrary (Python) |
| [web/](web/) | Frontend — site www.vr.com.br | Ruby + Cucumber + Capybara + Selenium + SitePrism |
| [web-cypress/](web-cypress/) | Frontend — mesmo cenário | Cypress (JavaScript) + Page Objects |
| [web-playwright/](web-playwright/) | Frontend — mesmo cenário | Playwright Test (JavaScript) + Page Objects |
| [web-robot/](web-robot/) | Frontend — mesmo cenário | Robot Framework + SeleniumLibrary (Python) |

## Conceitos aplicados

- BDD com Gherkin em português
- Page Objects (SitePrism) no frontend e Service Object (HTTParty) no backend
- Clean Code / DRY: steps enxutos, URLs e seletores centralizados em uma única classe
- Estado isolado por cenário (variáveis de instância do World do Cucumber, sem variáveis globais)
- Relatório HTML do Cucumber e screenshot automático em caso de falha

## Pré-requisitos

- Ruby 2.7+ e Bundler (api/ e web/)
- Node.js 18+ (web-cypress/ e web-playwright/)
- Python 3.9+ (web-robot/)
- Google Chrome — todos os projetos de frontend usam o Chrome instalado; o chromedriver compatível
  é resolvido automaticamente (gem `webdrivers` no Ruby, Selenium Manager no Robot)

## Backend

Endpoint: `https://portal.vr.com.br/api-web/comum/enumerations/VRPAT`

Etapas validadas:
- Requisição GET retorna status 200
- O JSON possui a chave `typeOfEstablishment` com uma lista não vazia
- Um tipo de estabelecimento é sorteado e exibido no console e no relatório

O mesmo cenário foi implementado em quatro ferramentas:

```bash
# Ruby + Cucumber + HTTParty  (relatório: api/reports/report.html)
cd api
bundle install
bundle exec cucumber

# Cypress
cd api-cypress
npm install
npm test

# Playwright  (não abre navegador; relatório: npm run report)
cd api-playwright
npm install
npm test

# Robot Framework  (relatório: api-robot/results/report.html)
cd api-robot
python -m venv .venv
.venv\Scripts\activate            # Linux/macOS: source .venv/bin/activate
pip install -r requirements.txt
robot -d results tests
```

Exemplo de saída:

```
Tipo de estabelecimento sorteado (56 disponíveis): Alimentação - Queijaria [key: ALIMENT|QUEIJARIA | name: QUEIJARIA]
```

## Frontend

### Etapas pedidas no teste (2021)
1. Acessar https://www.vr.com.br
2. Navegar até a seção "Pra Você" (`/onde-aceita.htm`)
3. Clicar no botão "Onde usar meu cartão VR"
4. Validar que o mapa do Google abriu em tela

### O que mudou no site
O site foi reformulado depois que o teste foi escrito: `/onde-aceita.htm` agora **redireciona para `/superapp`**.
O botão "Onde usar meu cartão VR" e o mapa do Google não existem mais no site; o mapa de estabelecimentos
passou a ser uma funcionalidade do **SuperApp VR**, apresentada na página como "Onde usar: mapa de estabelecimentos".

### Cenário automatizado (adaptado ao site atual)
1. Acessa https://www.vr.com.br e confirma que a home carregou
2. Navega até a seção "Pra Você" pelo endereço legado `/onde-aceita.htm`
3. Valida o redirecionamento para a página do SuperApp VR
4. Valida que a funcionalidade "Onde usar: mapa de estabelecimentos" está visível, com os links da App Store e do Google Play

O mesmo cenário foi implementado em quatro ferramentas:

```bash
# Ruby + Cucumber + Capybara + SitePrism  (relatório: web/reports/report.html)
cd web
bundle install
bundle exec cucumber              # Chrome headless
bundle exec cucumber -p visual    # Chrome visível

# Cypress  (screenshots de falha: web-cypress/cypress/screenshots/)
cd web-cypress
npm install
npm test                          # headless
npm run test:open                 # modo interativo

# Playwright  (relatório: npm run report)
cd web-playwright
npm install
npm test                          # headless
npm run test:headed               # Chrome visível

# Robot Framework  (relatório: web-robot/results/report.html)
cd web-robot
python -m venv .venv
.venv\Scripts\activate            # Linux/macOS: source .venv/bin/activate
pip install -r requirements.txt
robot -d results tests                                   # headless
robot -d results --variable BROWSER:chrome tests         # Chrome visível
```

## CI/CD

O workflow [vr-tests.yml](../.github/workflows/vr-tests.yml) (GitHub Actions) executa todos os testes
automaticamente em cada **pull request** que altere a pasta `VR/`. Também pode ser disparado manualmente
pela aba **Actions** (botão "Run workflow").

- 8 jobs em paralelo (Ruby, Cypress, Playwright e Robot × API e frontend), cada um aparece como um check no PR
- `fail-fast: false`: uma ferramenta com falha não interrompe as demais
- Relatórios e evidências de cada job ficam disponíveis como *artifacts* da execução

Para bloquear o merge quando algum teste falhar, marque os checks como obrigatórios em
**Settings › Branches › Branch protection rules** (branch `main` › *Require status checks to pass before merging*).

## Solução de problemas

- **"This version of ChromeDriver only supports Chrome version X"**: há um chromedriver antigo no PATH.
  Os projetos já contornam isso (Ruby via `webdrivers`, Robot via Selenium Manager com `--skip-driver-in-path`),
  mas remover drivers antigos do PATH evita o problema em outros projetos.
- **Cypress: "bad option: --smoke-test"**: o terminal herdou `ELECTRON_RUN_AS_NODE=1` (acontece em alguns
  terminais integrados do VS Code). Remova a variável antes de rodar: `Remove-Item Env:ELECTRON_RUN_AS_NODE`
  (PowerShell) ou `unset ELECTRON_RUN_AS_NODE` (bash).
- **Robot: "unknown encoding: utf-8:surrogateescape"**: defina `PYTHONIOENCODING=utf-8` antes de rodar.
