<script lang="ts">
	export let title: String
	export let description: String = ''
</script>

<svelte:head>
	<title>Svord - {title}</title>
</svelte:head>

<header>
	<h1>{title}</h1>
</header>
<p>{description}</p>
<br />

<slot />
