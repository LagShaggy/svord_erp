<script lang="ts">
	import CountryFlag from '$src/lib/Icons/Flags/CountryFlag.svelte'
	import WebsiteIcon from '$src/lib/Icons/WebsiteIcon.svelte'
	import type { Account, Contact, Country } from '$src/lib/supabase/schema'
	import TableData from '../Molecules/TableData.svelte'
	import { getColourForIndex } from '../Molecules/tableHelpers'
	import TableRow from '../Molecules/TableRow.svelte'
	import { goto } from '$app/navigation'
	export let item: Contact
	export let index: number

	const colour = getColourForIndex(index)
	const handleClick = (e: MouseEvent) => {
		goto(`/contact/${item.id}`)
	}
</script>

<TableRow {colour} {handleClick} className="">
	<TableData className="md:block">
		{item.id}
	</TableData>
	<TableData className="max-w-[100px] truncate">
		{item.firstName}
	</TableData>
	<TableData className="max-w-[100px] truncate">
		{item.lastName}
	</TableData>
	<TableData className="max-w-[100px] truncate">
		{item.email}
	</TableData>
</TableRow>
