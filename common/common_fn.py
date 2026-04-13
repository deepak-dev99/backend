async def saveFile(fileObj, path):
    print("saveFile")

    content = await fileObj.read()

    with open(path, "wb") as f:
        f.write(content)


    return path