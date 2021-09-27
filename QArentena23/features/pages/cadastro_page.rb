class CadastroPage < SitePrism::page

    set_url '/cadastro'

    element :cmp_nome, '#field_nome'
    element :cmp_sobrenome, '#field_sobrenome'
    element :cmp_celular, '#field_telefone'
    element :cmp_email, '#field_email'
    element :rd_cpf, '#field_conta-0'
    element :rd_cnpj, '#field_conta-1'
    element :cmp_documento, '#field_documento'
    element :btn_enviar, '.frm_button_submit'
    element :msg_sucesso, '.frm_message'

end