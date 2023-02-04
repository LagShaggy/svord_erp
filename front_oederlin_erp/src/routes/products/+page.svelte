<script>
	export let data
	let { products } = data
	$: ({ products } = data)
	let suiticon = '/favicon.png'
</script>

<h1 class="font-body">PRODUCTS</h1>

<table>
	{#each products as product}
		<tr>
			<td>{product.name}</td><td>{product.data.colour}</td>
		</tr>
	{/each}
</table>

<style>
</style>
