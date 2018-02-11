<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<!-- saved from url=(0036)https://www.casadocodigo.com.br/cart -->
<html lang="pt-BR" class="wf-museo-n3-active wf-museo-n5-active wf-opensans-n7-active wf-opensans-n8-active wf-opensans-n4-active wf-opensans-n6-active wf-active"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width">
	<link rel="icon" href="https://cdn.shopify.com/s/files/1/0155/7645/t/229/assets/favicon.png?6587815016992574778" type="image/png">
	<link href="https://plus.google.com/108540024862647200608" rel="publisher">


				
<body>				
			
					
				
		
		<section class="infoSection container">
		
	<a href="${s:mvcUrl('CCC#itens').build()}"></a>
	<h2 class="infoSection-titulo">Seu carrinho</h2>
	
	
	<table class="formularioDoCarrinho-tabela">
		<thead class="formularioDoCarrinho-cabecalho">
			<tr>
				<th></th>
				<th class="formularioDoCarrinho-cabecalho-item">Item</th>
				<th class="formularioDoCarrinho-cabecalho-item formularioDoCarrinho-cabecalho-preco">Preço</th>
				<th class="formularioDoCarrinho-cabecalho-item">Qtd</th>
				<th class="formularioDoCarrinho-cabecalho-item">Total</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${carrinhoCompras.itens }" var="item">
			<tr>
				<td class="formularioDoCarrinho-item">
					<a href="https://www.casadocodigo.com.br/products/livro-jsf-jpa">
						<img class="formularioDoCarrinho-item-imagem" src="./carrinho_files/jsf-jpa-featured_small.png">
					</a>
				</td>
				<td class="formularioDoCarrinho-item">
					<h2 class="formularioDoCarrinho-item-titulo">${item.produto.titulo }</h2>
				</td>
				<td class="formularioDoCarrinho-item formularioDoCarrinho-item-preco">${item.preco }</td>
				<td class="formularioDoCarrinho-item">
					<input class="formularioDoCarrinho-item-quantidade" type="number" min="0" id="quantidade" name="quantidade" 
					value="${carrinhoCompras.getQuantidade(item)}">
				</td>
				<td class="formularioDoCarrinho-item formularioDoCarrinho-item-precoTotal" title="Preço unitário: R$29,90">
				${carrinhoCompras.getTotal(item)}
				</td>
				<td class="formularioDoCarrinho-item">
					<form action="${s:mvcUrl('CCC#remover').arg(0,item.produto.id).arg(1,item.tipoPreco).build() }" 
					method="post">
						<input type="image" src="./carrinho_files/trash.png" alt="X" title="Remover" value="Excluir">
					</form>
				</td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot class="formularioDoCarrinho-rodape">
			<tr>
				<td class="formularioDoCarrinho-rodape-item formularioDoCarrinho-finalizar" colspan="3">
				
				<form action="${s:mvcUrl('PC#finalizar').build() }" method="post">
				
				<input type="submit" class="checkout" name="checkout" value="Finalizar compra" id="checkout"/>			
					
					
				</form>
				</td>
				
				<td class="formularioDoCarrinho-rodape-item">
					${carrinhoCompras.total}
				</td>
				<td></td>
			</tr>
		</tfoot>
	</table>

	
</section>
		

</body></html>