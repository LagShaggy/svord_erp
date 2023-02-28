<script>
	export let description
</script>

<div>
	<h1 class="mb-4">
		<slot />
	</h1>
	{#each Object.entries(description) as [key, value]}
		<div
			class="mt-2 mb-6 flex items-end justify-between pb-6"
		>
			<h2 class="text-base font-semibold">
				{key.toUpperCase()}
			</h2>
			<p>
				{value}
			</p>
		</div>
	{/each}
</div>
