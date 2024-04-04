<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'
	import ProductRow from '$lib/UI/Table/Rows/ProductRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'
	import ActionButton from '$src/lib/UI/ActionButton/ActionButton.svelte'
	import { actionStore } from '$src/lib/UI/ActionButton/actionButtonStore'
	import { onDestroy } from 'svelte'
	import type { PageData } from './$types'
	import { goto } from '$app/navigation'

	export let data: PageData
	let { products } = data
	// sveltekit reactivity when something has changed.
	$: ({ products } = data)

	let maxPages: number = 20
	let currentIndex: number

	actionStore.add({ command: () => goto('/products/create'), img: '/icons/plus.svg' })

	onDestroy(() => {
		actionStore.reset()
	})
</script>

<BasePage title={'PRODUCTS'}>
	<div class="flex justify-center">
		<Table let:item let:index items={products}>
			<ProductRow {item} {index} />
		</Table>
	</div>
	<!-- <PageController bind:currentIndex {maxPages}></PageController> -->
</BasePage>

<style>
</style>
