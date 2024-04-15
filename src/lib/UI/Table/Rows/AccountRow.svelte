<script lang="ts">
	import type { Account } from '$src/lib/supabase/schema'
	import TableData from '../Molecules/TableData.svelte'
	import { getColourForIndex } from '../Molecules/tableHelpers'
	import TableRow from '../Molecules/TableRow.svelte'

	export let item: Account
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
		{item.country}
	</TableData>
	<TableData>
		{item.name}
	</TableData>
	<TableData>
		{item.accepted_currencies}
	</TableData>
	<TableData>
		{item.description}
	</TableData>
	<TableData>
		{item.country}
	</TableData>
</TableRow>
