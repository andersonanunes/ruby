"""Keywords auxiliares para resolver o chromedriver.

Por padrão o Selenium usa o primeiro chromedriver encontrado no PATH, mesmo que ele seja de
outra versão do Chrome (gerando "This version of ChromeDriver only supports Chrome version X").
Aqui o Selenium Manager é chamado com --skip-driver-in-path para ignorar drivers antigos e
baixar/reaproveitar o chromedriver compatível com o Chrome instalado.
"""
from selenium.webdriver.common.selenium_manager import SeleniumManager


def obter_caminho_do_chromedriver():
    """Retorna o caminho do chromedriver compatível com o Chrome instalado.

    O caminho volta com "/" (aceito pelo Windows) porque o SeleniumLibrary interpreta o argumento
    "service" como código Python, onde "\\" seria tratado como sequência de escape.
    """
    resultado = SeleniumManager().binary_paths(["--browser", "chrome", "--skip-driver-in-path"])
    return resultado["driver_path"].replace("\\", "/")
