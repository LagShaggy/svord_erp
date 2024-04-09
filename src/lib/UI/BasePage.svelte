<script lang="ts">
	export let title: String
	export let description: String = ''
</script>

<svelte:head>
	<title>Svord - {title}</title>
</svelte:head>

<div class="lg:px-4">
	<header class="px-2">
		<h1>{title}</h1>
	</header>
	<p>{description}</p>
	<slot />
</div>
