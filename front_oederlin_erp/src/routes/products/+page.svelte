<script>
	import StorePanel from '$lib/StoreUI/StorePanel.svelte';

	// sveltekit reactivity when something has changed.
	/** @type {import('./$types').PageData} */
	export let data;
	let { products } = data;
	$: ({ products } = data);
</script>

<h1 class="text-4xl">PRODUCTS</h1>
<br />

<div />

<div class="justify-center">
	<StorePanel {products} />
</div>

<style>
</style>
