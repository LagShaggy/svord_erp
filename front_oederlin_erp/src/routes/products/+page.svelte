<script>
	import StorePanel from '$lib/StoreUI/StorePanel.svelte';

	export let data;
	let { products } = data;
	$: ({ products } = data);
</script>

<h1 class="text-4xl">PRODUCTS</h1>
<br />

<div />

<div>
	<StorePanel />
</div>

<style>
</style>
