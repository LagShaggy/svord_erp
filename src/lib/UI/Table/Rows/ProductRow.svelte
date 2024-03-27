<script lang="ts">
	import { redirect } from '@sveltejs/kit'
	import TableData from '../Molecules/TableData.svelte'
	import { getColourForIndex } from '../Molecules/tableHelpers'
	import TableRow from '../Molecules/TableRow.svelte'
	import { goto } from '$app/navigation'

	export let item
	export let index: number
	const colour = getColourForIndex(index)
	const handleClick = (e: MouseEvent) => {
		goto(`/products/item/${item.id}`)
	}
</script>

<TableRow {colour} {handleClick}>
	<TableData>
		{item.id}
	</TableData>
	<TableData>
		{item.name}
	</TableData>
	<TableData>
		{item.description}
	</TableData>
</TableRow>
