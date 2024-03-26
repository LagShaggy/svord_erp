<script lang="ts">
	import StorePanel from '$lib/StoreUI/StorePanel.svelte'
	import BasePage from '$lib/UI/BasePage.svelte'
	import ProductRow from '$lib/UI/Table/Rows/ProductRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'
	import type { PageData } from './$types'

	export let data: PageData
	let { products } = data
	// sveltekit reactivity when something has changed.
	$: ({ products } = data)
</script>

<BasePage title={'PRODUCTS'}>
	<div class="flex justify-center">
		<Table let:item let:index items={products}>
			<ProductRow {item} {index} />
		</Table>
	</div>
</BasePage>

<style>
</style>
