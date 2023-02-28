<script>
	import StorePanel from '$lib/StoreUI/StorePanel.svelte'

	/** @type {import('./$types').PageData} */
	export let data
	let { products } = data
	// sveltekit reactivity when something has changed.
	$: ({ products } = data)

	//head
	export let title = 'PRODUCTS'
</script>

<header>
	<h1>{title}</h1>
</header>
<br />

<div />

<div class="flex justify-center">
	<StorePanel {products} />
</div>

<style>
</style>
