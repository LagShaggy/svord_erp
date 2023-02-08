<script>
	import StorePanel from '$lib/StoreUI/StorePanel.svelte';

	export let data;
	let { products } = data;
	$: ({ products } = data);
</script>

<h1 class="font-oswald text-4xl font-medium">PRODUCTS</h1>
<br />

<div />

<div>
	<StorePanel />
</div>

<style>
</style>
