<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'
	import ProductRow from '$lib/UI/Table/Rows/ProductRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'
	import { actionStore } from '$src/lib/UI/ActionButton/actionButton'
	import { onDestroy } from 'svelte'
	import type { PageData } from './$types'
	import { goto } from '$app/navigation'
	import Add from '$src/lib/Icons/Add.svelte'
	import ModalWindow from '$src/lib/UI/Modal/ModalWindow.svelte'
	import CreateAccount from '$src/lib/Account/CreateAccount.svelte'

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
	<ModalWindow>
		<CreateAccount account={null}></CreateAccount>
	</ModalWindow>
	<div class="flex justify-center">
		<Table let:item let:index items={products}>
			<ProductRow {item} {index} />
		</Table>
	</div>
	<!-- <PageController bind:currentIndex {maxPages}></PageController> -->
</BasePage>

<style>
</style>
