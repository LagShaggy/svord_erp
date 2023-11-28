<script lang="ts">
	import TableHeader from './Molecules/TableHeader.svelte'
	import { getKeys } from './Molecules/tableHelpers'

	export let items: any[] | null
	const keys = getKeys(items && items[0])
</script>

<table class="min-w-full leading-normal overflow-y-auto">
	<thead class="sticky top-[64px]">
		<tr>
			{#each keys as column}
				<TableHeader>{column}</TableHeader>
			{/each}
		</tr>
	</thead>
	<tbody class="bg-white divide-y divide-gray-200">
		{#each items ?? [] as item, index (item.id)}
			<slot {item} {index} />
		{/each}
	</tbody>
</table>
