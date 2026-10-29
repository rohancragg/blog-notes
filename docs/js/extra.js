(() => {
    const renderMermaid = async () => {
        if (typeof mermaid === "undefined") {
            return;
        }

        await new Promise((resolve) => requestAnimationFrame(resolve));
        const diagrams = [...document.querySelectorAll("pre.mermaid")];
        for (const [index, diagram] of diagrams.entries()) {
            try {
                const source = diagram.querySelector("code")?.textContent ?? diagram.textContent ?? "";
                if (!source.trim()) {
                    console.error("Mermaid diagram has no source.", diagram);
                    continue;
                }

                const { svg, bindFunctions } = await mermaid.render(
                    `mermaid-${Date.now()}-${index}`,
                    source
                );
                const container = document.createElement("div");
                container.className = "mermaid";
                container.innerHTML = svg;
                diagram.replaceWith(container);
                bindFunctions?.(container);
            } catch (error) {
                console.error("Failed to render Mermaid diagram.", error);
            }
        }
    };

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", renderMermaid);
    } else {
        renderMermaid();
    }
    window.addEventListener("load", renderMermaid, { once: true });
    document.addEventListener("DOMContentSwitch", renderMermaid);
})();
