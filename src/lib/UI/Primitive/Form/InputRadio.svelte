<script lang="ts">
	export let options: any[] | null
	export let name: string
</script>

<slot />
<div class="flex flex-col ml-auto">
	{#each options as option (option.id)}
		<div>
			<input type="radio" id={option.id} value={option.id} {name} />
			<label for={option.id}>
				{option.name}
			</label>
		</div>
	{/each}
</div>
