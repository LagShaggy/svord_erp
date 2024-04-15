<script lang="ts">
	export let title: string
	export let className: string = ''
</script>

<svelte:head>
	<title>Svord - {title}</title>
</svelte:head>

<header>
	<h1>{title}</h1>
</header>
<main>
	<slot />
</main>
