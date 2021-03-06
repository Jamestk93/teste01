{% extends 'layouts/index.volt' %}

    {% block content %}

        <div id="cadastro_ticket" class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="glyphicon glyphicon-plus"></i>
                        &nbsp;Cadatrar Notícia
                    </div>
                    {{ form('noticias/salvar', 'method': 'post', 'enctype' : 'multipart/form-data', 'name':'cadastrar') }}
                        <div class="panel-body">
                            <div class="col-md-12"  id="conteudo">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Titulo">Título <span class="error">(*)<span></label>
                                                    {{ form.render('titulo') }}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Texto">Texto</label>
                                                    {{ form.render('texto') }}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-sm-4">
                                                <label for ="Categoria">Categoria</label>
                                                    {{ select("categoria_id", categoria, 'using': ['id', 'nome_categoria']) }}
                                            </div>
                                            <div class="form-group col-sm-4">
                                                    {{ form.render('publicado') }}
                                                <label for ="Categoria">Marque para publicar</label>
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <label class="data_publicacao" for ="data_publicacao">Data da publicação</label>
                                                    {{ form.render('data_publicacao') }}
                                            </div>
                                        </div>
                                    </div>{#/.panel-body#}
                                </div>{#/.panel#}
                                <div class="row" style="text-align:right;">
                                    <div id="buttons-cadastro" class="col-md-12">
                                        <a href="{{ url(['for':'noticia.lista']) }}" class="btn btn-default">Cancelar</a>
                                        {{ submit_button('Gravar', "class": 'btn btn-primary') }}
                                    </div>
                                </div>
                            </div>{#/.conteudo#}
                        </div>{#/.panel-body#}
                    {{ end_form() }}
                </div>{#/.panel#}
            </div>{#/.col-md-12#}
        </div><!-- row -->

    {% endblock %}

    {%  block extrafooter %}
        
        <script>
            $(document).ready(function(){
                $('.data_publicacao').hide();
            });

            var publicado = $('#publicado');
            
            publicado.click(function () {
                $("#data_publicacao").val("");
                if (publicado.is(":checked")) {
                    $('.data_publicacao').show();
                }else{
                    $('.data_publicacao').hide();
                }

            });

            
            
        </script>
    {% endblock %}
