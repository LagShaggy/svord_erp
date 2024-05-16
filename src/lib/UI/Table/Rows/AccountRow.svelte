<script lang="ts">
	import CountryFlag from '$src/lib/Icons/Flags/CountryFlag.svelte'
	import type { Account, Country } from '$src/lib/supabase/schema'
	import TableData from '../Molecules/TableData.svelte'
	import { getColourForIndex } from '../Molecules/tableHelpers'
	import TableRow from '../Molecules/TableRow.svelte'
	export let item: Account & { country: Country }
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
		<CountryFlag country={item.country.iso} />
		{item.country.iso3 ?? item.country.iso}
	</TableData>
	<TableData>
		{item.name}
	</TableData>
	<TableData>
		{item.description}
	</TableData>
</TableRow>
