<script lang="ts">
	import StorePanel from '$lib/StoreUI/StorePanel.svelte'
	import BasePage from '$lib/UI/BasePage.svelte'

	/** @type {import('./$types').PageData} */
	export let data: any
	let { products } = data
	// sveltekit reactivity when something has changed.
	$: ({ products } = data)
</script>

<BasePage title={'PRODUCTS'}>
	<div class="flex justify-center">
		<StorePanel {products} />
	</div>
</BasePage>

<style>
</style>
