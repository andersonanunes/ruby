# Ao final de cada cenário com falha, salva um screenshot como evidência
# e o anexa ao relatório HTML do Cucumber.
After do |scenario|
  next unless scenario.failed?

  nome = scenario.name.gsub(/[^\w]+/, '_').downcase
  caminho = "reports/screenshots/#{nome}.png"
  begin
    page.save_screenshot(caminho)
    attach(caminho, 'image/png')
  rescue StandardError => e
    # Se o navegador nem chegou a abrir, não há tela para capturar; não mascara a falha original.
    log("Screenshot não capturado: #{e.message}")
  end
end
