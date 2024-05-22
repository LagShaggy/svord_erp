<script lang="ts">
	import CountryFlag from '$src/lib/Icons/Flags/CountryFlag.svelte'
	import WebsiteIcon from '$src/lib/Icons/WebsiteIcon.svelte'
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

<TableRow {colour} {handleClick} className="">
	<TableData className="hidden md:block">
		{item.id}
	</TableData>
	<TableData className="max-md:pl-5 max-md:flex max-md:flex-col max-md:justify-between">
		<CountryFlag country={item.country.iso} />
		{item.country.iso3 ?? item.country.iso}
	</TableData>
	<TableData>
		<div class="flex md:flex-row gap-2 items-center">
			<WebsiteIcon url={item.website} />
			{item.name}
		</div>
	</TableData>
	<TableData>
		<a href={'https://' + item.website} class="text-primary-600" target="_blank" rel="external">
			{item.website}
		</a>
	</TableData>
	<TableData className="max-w-[100px] truncate">
		{item.description} Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo libero sapiente
		explicabo praesentium quisquam tempora voluptatem eos aut rerum, blanditiis est. Dolorum optio, consequatur
		sunt et nemo officia omnis praesentium?
	</TableData>
</TableRow>
