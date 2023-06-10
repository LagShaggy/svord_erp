<script lang="ts">
	export let description: any
</script>

<div>
	<h2 class="mb-4">
		<slot />
	</h2>
	{#each Object.entries(description) as [key, value]}
		<div
			class="items-top mt-2 mb-6 flex justify-between gap-4 pb-2"
		>
			<p class="font-semibold">
				{key}
			</p>
			<p>
				{value}
			</p>
		</div>
		<hr />
	{/each}
</div>
