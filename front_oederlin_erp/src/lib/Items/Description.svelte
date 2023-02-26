<script>
	export let description
	console.log(description)
</script>

<div>
	{#each Object.entries(description) as [key, value]}
		<div>
			<h2>{key}</h2>
			<p>{value}</p>
		</div>
	{/each}
</div>
