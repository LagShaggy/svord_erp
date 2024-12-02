<script lang="ts" generics="T extends { id: number }">
	export let items: T[] | null
</script>

<table class="w-full">
	<tbody class="bg-white divide-y divide-gray-200">
		{#each items ?? [] as item, index (item.id)}
			<slot {item} {index} />
		{/each}
	</tbody>
</table>
