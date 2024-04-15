<script lang="ts">
	import TableData from '../Molecules/TableData.svelte'
	import { getColourForIndex } from '../Molecules/tableHelpers'
	import TableRow from '../Molecules/TableRow.svelte'
	import { goto } from '$app/navigation'
	import type { Product } from '$src/lib/supabase/schema'
	import ProductCategory from '$src/lib/Badges/ProductCategory.svelte'

	export let item: Product
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
		<ProductCategory category={item.category} />
	</TableData>
	<TableData>
		{item.name}
	</TableData>
	<TableData>
		{item.description}
	</TableData>
</TableRow>
