<script lang="ts">
	import StorePanel from '$lib/StoreUI/StorePanel.svelte'
	import BasePage from '$lib/UI/BasePage.svelte'
	import ProductRow from '$lib/UI/Table/Rows/ProductRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'
	import PageController from '$src/lib/UI/Pagination/PageController.svelte'
	import { type Stores, type Writable } from 'svelte/store'
	import type { PageData } from './$types'
	import { page } from '$app/stores'

	export let data: PageData
	let { products } = data
	// sveltekit reactivity when something has changed.
	$: ({ products } = data)

	let maxPages: number = 20
	let currentIndex: number
</script>

<BasePage title={'PRODUCTS'}>
	<div class="flex flex-row justify-end">
		<a href="/products/create" class="border p-1 rounded-md border-black flex flex-row gap-2">
			Add new Product
			<img src="/icons/plus.svg" alt="" />
		</a>
	</div>
	<div class="flex justify-center">
		<Table let:item let:index items={products}>
			<ProductRow {item} {index} />
		</Table>
	</div>
	<PageController bind:currentIndex {maxPages} className={'sticky bottom-14'}></PageController>
</BasePage>

<style>
</style>
