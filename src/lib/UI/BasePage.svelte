<script lang="ts">
	export let title: String
	export let description: String = ''
</script>

<svelte:head>
	<title>Svord - {title}</title>
</svelte:head>

<header class="pl-2">
	<h1>{title}</h1>
</header>
<p>{description}</p>
<slot />
