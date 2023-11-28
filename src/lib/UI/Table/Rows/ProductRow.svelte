<script lang="ts">
	import type { Product } from '@prisma/client'
	import TableData from '../Molecules/TableData.svelte'
	import { getColourForIndex } from '../Molecules/tableHelpers'
	import TableRow from '../Molecules/TableRow.svelte'

	export let item: Product
	export let index: number
	const colour = getColourForIndex(index)
	const handleClick = (e: MouseEvent) => {
		console.log('hello')
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
