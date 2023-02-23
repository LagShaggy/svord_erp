<script>
	import { onMount } from 'svelte';
	export let data;
	let { users } = data;

	onMount(async () => {
		$: ({ users } = data);
	});
</script>

<div class="col-end-1">
	<h1>USERS</h1>
	<ul>
		{#each users as user}
			<li>
				{user.firstname +
					' ' +
					user.lastname +
					' joined on ' +
					user.joined}
			</li>
		{/each}
	</ul>
	<a href="/">Home</a>
</div>
<slot />

<style>
</style>
