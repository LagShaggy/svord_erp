<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'
	import ProductRow from '$lib/UI/Table/Rows/ProductRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'
	import { actionStore } from '$src/lib/UI/ActionButton/actionButton'
	import { onDestroy } from 'svelte'
	import type { PageData } from './$types'
	import { goto } from '$app/navigation'
	import Add from '$src/lib/Icons/Add.svelte'
	import LoadingS from '$src/lib/Icons/LoadingS.svelte'

	export let data: PageData
	let { products } = data
	$: ({ products } = data)

	let maxPages: number = 20
	let currentIndex: number

	actionStore.add({ command: () => goto('/products/create'), img: Add })

	onDestroy(() => {
		actionStore.reset()
	})
</script>

<BasePage title={'PRODUCTS'} className="-mx-5">
	{#await products}
		<LoadingS></LoadingS>
	{:then { data: products, error }}
		<div class="flex justify-center">
			<Table let:item let:index items={products}>
				<ProductRow {item} {index} />
			</Table>
		</div>
		<!-- <PageController bind:currentIndex {maxPages}></PageController> -->
	{:catch error}
		error
	{/await}
</BasePage>

<style>
</style>
